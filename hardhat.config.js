require('@nomicfoundation/hardhat-toolbox');
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */

const RPC_URL =
  process.env.Rinkeby_RPC_URL ||
  ' https://eth-rinkeby.alchemyapi.io/v2/rj5MowL_Uo2kF1GFieq2WhDnvk0Bbvn4';
const PRIVATE_KEY =
  process.env.PRIVATE_KEY ||
  '5442527772e6e63b30c3683fbe6b1a53f2e9f076c411f2872093a0cbacc4519d';
console.log('working key yeah', process.env.PRIVATE_KEY);
module.exports = {
  solidity: '0.8.7',
  defaultNetwork: 'hardhat',
  networks: {
    hardhat: {},
    rinkeby: {
      url: RPC_URL,
      accounts: [PRIVATE_KEY],
      chainid: 4,
    },
  },
};
