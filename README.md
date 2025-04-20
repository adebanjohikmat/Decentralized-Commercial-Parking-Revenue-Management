# Decentralized Commercial Parking Revenue Management

A blockchain-based solution for managing commercial parking operations and revenue streams through smart contracts.

## Overview

This system employs a suite of interconnected smart contracts to automate and decentralize the management of commercial parking facilities, pricing structures, payment processing, and revenue reconciliation. By leveraging blockchain technology, the platform ensures transparency, security, and efficiency in parking operations.

## Core Components

### Facility Registration Contract
- Records and maintains details of parking structures
- Manages ownership and operational status of facilities
- Tracks available spaces and facility specifications

### Rate Management Contract
- Defines dynamic pricing models for different time periods
- Supports various rate structures (hourly, daily, monthly)
- Allows for special rates and promotional pricing

### Payment Processing Contract
- Handles collection and verification of parking fees
- Processes cryptocurrency payments
- Issues digital receipts and parking validations

### Revenue Reconciliation Contract
- Tracks income against space utilization
- Provides real-time financial reporting
- Distributes revenue to stakeholders according to predefined rules

## Getting Started

### Prerequisites
- Ethereum wallet (MetaMask recommended)
- Ethereum development environment (Truffle/Hardhat)
- Node.js (v16+)
- Web3.js or ethers.js

### Installation

1. Clone the repository
```
git clone https://github.com/yourusername/decentralized-parking.git
cd decentralized-parking
```

2. Install dependencies
```
npm install
```

3. Compile smart contracts
```
npx hardhat compile
```

4. Deploy to test network
```
npx hardhat run scripts/deploy.js --network <network-name>
```

## Usage Examples

### Register a New Parking Facility
```javascript
await facilityContract.registerFacility(
  "Downtown Garage",
  "123 Main Street",
  100, // total spaces
  true, // is covered
  ["EV charging", "Security cameras"]
);
```

### Set Parking Rates
```javascript
await rateContract.setHourlyRate(
  facilityId,
  0.02, // ETH amount
  8, // start hour (24h format)
  18 // end hour (24h format)
);
```

### Process Payment
```javascript
await paymentContract.processPayment(
  facilityId,
  vehicleId,
  entryTime,
  exitTime,
  { value: ethers.utils.parseEther("0.05") }
);
```

## Future Development

- Mobile application for drivers
- Integration with IoT devices for automated entry/exit
- AI-powered dynamic pricing based on demand
- Cross-chain compatibility

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
