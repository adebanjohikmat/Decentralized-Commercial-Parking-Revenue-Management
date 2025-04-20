;; Facility Registration Contract
;; Records details of parking structures

(define-data-var last-facility-id uint u0)

(define-map facilities
  { facility-id: uint }
  {
    name: (string-ascii 100),
    address: (string-ascii 200),
    total-spaces: uint,
    owner: principal,
    active: bool
  }
)

(define-read-only (get-facility (facility-id uint))
  (map-get? facilities { facility-id: facility-id })
)

(define-read-only (get-last-facility-id)
  (var-get last-facility-id)
)

(define-public (register-facility
    (name (string-ascii 100))
    (address (string-ascii 200))
    (total-spaces uint))
  (let ((new-id (+ (var-get last-facility-id) u1)))
    (begin
      (asserts! (> total-spaces u0) (err u1)) ;; Must have at least 1 space
      (var-set last-facility-id new-id)
      (map-set facilities
        { facility-id: new-id }
        {
          name: name,
          address: address,
          total-spaces: total-spaces,
          owner: tx-sender,
          active: true
        }
      )
      (ok new-id)
    )
  )
)

(define-public (update-facility
    (facility-id uint)
    (name (string-ascii 100))
    (address (string-ascii 200))
    (total-spaces uint))
  (let ((facility (unwrap! (get-facility facility-id) (err u404))))
    (begin
      (asserts! (is-eq tx-sender (get owner facility)) (err u403))
      (asserts! (> total-spaces u0) (err u1))
      (map-set facilities
        { facility-id: facility-id }
        {
          name: name,
          address: address,
          total-spaces: total-spaces,
          owner: tx-sender,
          active: true
        }
      )
      (ok true)
    )
  )
)

(define-public (deactivate-facility (facility-id uint))
  (let ((facility (unwrap! (get-facility facility-id) (err u404))))
    (begin
      (asserts! (is-eq tx-sender (get owner facility)) (err u403))
      (map-set facilities
        { facility-id: facility-id }
        (merge facility { active: false })
      )
      (ok true)
    )
  )
)

(define-public (reactivate-facility (facility-id uint))
  (let ((facility (unwrap! (get-facility facility-id) (err u404))))
    (begin
      (asserts! (is-eq tx-sender (get owner facility)) (err u403))
      (map-set facilities
        { facility-id: facility-id }
        (merge facility { active: true })
      )
      (ok true)
    )
  )
)
