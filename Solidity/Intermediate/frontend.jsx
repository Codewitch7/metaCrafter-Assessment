'use client';
import { useState, useEffect } from 'react';
import { ethers, utils } from 'ethers';
import { SMART_CONTRACT_ADDRESS, SMART_CONTRACT_ABI } from '@/utils/myToken';

export default function Home() {
  const [isWalletConnected, setIsWalletConnected] = useState(false);
  const [inputValue, setInputValue] = useState({
    walletAddress: '',
    transferNGNtoken: '',
    burnAmount: '',
    mintAmount: '',
  });
  const [error, setError] = useState(null);
  const [tokenName, setTokenName] = useState('');
  const [tokenSymbol, setTokenSymbol] = useState('');
  const [isTokenOwner, setIsTokenOwner] = useState(false);
  const [tokenOwnerAddress, setTokenOwnerAddress] = useState(null);
  const [yourWalletAddress, setYourWalletAddress] = useState(null);
  const [tokenTotalInventory, setTokenTotalInventory] = useState(0);

  const myTokenContract = async () => {
    try {
      if (window.ethereum) {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();
        const contract = new ethers.Contract(
          SMART_CONTRACT_ADDRESS,
          SMART_CONTRACT_ABI,
          signer
        );
        const [account] = await window.ethereum.request({
          method: 'eth_requestAccounts',
        });

        let tokenName = await contract.name();
        let tokenSymbol = await contract.symbol();
        let tokenOwner = await contract.owner();
        let inventory = await contract.totalSupply();

        inventory = utils.formatEther(inventory);

        setTokenName(tokenName);
        setTokenSymbol(tokenSymbol);
        setTokenTotalInventory(inventory);
        // setTokenBalance(balance);
        setTokenOwnerAddress(tokenOwner);

        if (account.toLowerCase() === tokenOwner.toLowerCase()) {
          setIsTokenOwner(true);
        }
      }
    } catch (error) {
      console.log(error);
    }
  };

  const mint = async (e) => {
    e.preventDefault();
    try {
      if (window.ethereum) {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();
        const contract = new ethers.Contract(
          SMART_CONTRACT_ADDRESS,
          SMART_CONTRACT_ABI,
          signer
        );

        const amount = utils.parseEther(inputValue.mintAmount);
        const txn = await contract.mint(amount);
        await txn.wait();
        alert('Becky tokens 🪙 minted');
        let inventory = await contract.totalSupply();
        inventory = utils.formatEther(inventory);
        setTokenTotalInventory(inventory);
      } else {
        setError(error);
      }
    } catch (error) {
      console.log(error);
    }
  };

  const burn = async (event) => {
    event.preventDefault();
    try {
      if (window.ethereum) {
        const provider = new ethers.providers.Web3Provider(window.ethereum);
        const signer = provider.getSigner();
        const contract = new ethers.Contract(
          SMART_CONTRACT_ADDRESS,
          SMART_CONTRACT_ABI,
          signer
        );

        const txn = await contract.burn(
          utils.parseEther(inputValue.burnAmount)
        );

        await txn.wait();
        alert('Burned Some Becky tokens 🪙');

        let inventory = await contract.totalSupply();
        inventory = utils.formatEther(inventory);
        setTokenTotalInventory(inventory);
      } else {
        setError(error);
      }
    } catch (error) {
      console.log(error);
    }
  };

  const walletConnected = async () => {
    try {
      if (window.ethereum) {
        const accounts = await window.ethereum.request({
          method: 'eth_requestAccounts',
        });
        const account = accounts[0];
        setIsWalletConnected(true);
        setYourWalletAddress(account);
      } else {
        setError(error);
      }
    } catch (error) {
      console.log(error);
    }
  };

  const handleInputChange = (e) => {
    setInputValue((prevFormData) => ({
      ...prevFormData,
      [e.target.name]: e.target.value,
    }));
  };

  useEffect(() => {
    walletConnected();
    myTokenContract();
  }, []);

  return (
    <div className='relative flex flex-col-reverse py-16 lg:py-0 lg:flex-col'>
      <div className='w-full max-w-xl px-4 mx-auto md:px-0 lg:px-8 lg:py-20 lg:max-w-screen-xl'>
        <div className='mb-0 lg:max-w-lg lg:pr-8 xl:pr-6'>
          <h2 className='mb-5 font-sans text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl sm:leading-none md:text-center'>
            The {tokenName} Contract
          </h2>
          <p className='mb-5 text-base text-gray-700 md:text-lg md:text-center'>
            Total Supply: {tokenTotalInventory}
          </p>
          <p className='mb-5 text-base text-gray-700 md:text-lg md:text-center'>
            Contract Address: {SMART_CONTRACT_ADDRESS}
          </p>
          <div>
            {isWalletConnected ? (
              <h4 className='mb-6 font-sans font-bold tracking-tight text-purple-400 sm:text-2xl sm:leading-none'>
                User Wallet Address:
                <br className='block' />
                <span className='relative inline-block px-2'>
                  <div className='absolute inset-0 transform -skew-x-12 bg-teal-accent-400' />
                  <span className='relative text-purple-400'>
                    {yourWalletAddress}
                  </span>
                </span>
              </h4>
            ) : (
              <button
                onClick={walletConnected}
                className='inline-flex items-center justify-center w-full h-12 px-6 font-semibold tracking-wide text-white transition duration-200 rounded shadow-lg md:w-auto bg-purple-400 hover:bg-teal-accent-700 focus:shadow-outline focus:outline-none'
              >
                Connect Wallet
              </button>
            )}
          </div>
          {/* ==================================================================== */}
          {isTokenOwner && (
            <div>
              {/******************** mint tokens ******************/}
              <form className='flex flex-col items-center w-full mb-4 md:flex-row md:px-16'>
                <input
                  onChange={handleInputChange}
                  name='mintAmount'
                  placeholder='mint'
                  value={inputValue.mintAmount}
                  type='text'
                  className='flex-grow w-full h-12 px-4 mb-3 text-purple-400 transition duration-200 border-2 border-transparent rounded appearance-none md:mr-2 md:mb-0 bg-deep-purple-900 focus:border-teal-accent-700 focus:outline-none focus:shadow-outline'
                />
                <button
                  onClick={mint}
                  className='inline-flex items-center justify-center w-full h-12 px-6 font-semibold tracking-wide text-white transition duration-200 rounded shadow-lg md:w-auto bg-purple-400 hover:bg-teal-accent-700 focus:shadow-outline focus:outline-none'
                >
                  Mint
                </button>
              </form>
              {/******************** burn tokens ******************/}
              <form className='flex flex-col items-center w-full mb-4 md:flex-row md:px-16'>
                <input
                  onChange={handleInputChange}
                  name='burnAmount'
                  placeholder={'burn Tokens'}
                  value={inputValue.burnAmount}
                  type='text'
                  className='flex-grow w-full h-12 px-4 mb-3 text-purple-400 transition duration-200 border-2 border-transparent rounded appearance-none md:mr-2 md:mb-0 focus:border-teal-accent-700 focus:outline-none focus:shadow-outline'
                />
                <button
                  onClick={burn}
                  className='inline-flex items-center justify-center w-full h-12 px-6 font-semibold tracking-wide text-white transition duration-200 rounded shadow-lg md:w-auto bg-purple-400 hover:bg-teal-accent-700 focus:shadow-outline focus:outline-none'
                >
                  Burn
                </button>
              </form>
            </div>
          )}
          {/* ==================================================================== */}
          <div className='flex flex-col items-center'>
            <div className='mb-2 text-sm text-gray-600 md:mb-2'>Follow us</div>
            <div className='flex items-center space-x-4'>
              <div className='flex items-center'>
                <a
                  href='/'
                  className='text-gray-600 transition-colors duration-300 hover:text-deep-purple-accent-400'
                >
                  <svg viewBox='0 0 24 24' fill='currentColor' className='h-5'>
                    <path d='M24,4.6c-0.9,0.4-1.8,0.7-2.8,0.8c1-0.6,1.8-1.6,2.2-2.7c-1,0.6-2,1-3.1,1.2c-0.9-1-2.2-1.6-3.6-1.6 c-2.7,0-4.9,2.2-4.9,4.9c0,0.4,0,0.8,0.1,1.1C7.7,8.1,4.1,6.1,1.7,3.1C1.2,3.9,1,4.7,1,5.6c0,1.7,0.9,3.2,2.2,4.1 C2.4,9.7,1.6,9.5,1,9.1c0,0,0,0,0,0.1c0,2.4,1.7,4.4,3.9,4.8c-0.4,0.1-0.8,0.2-1.3,0.2c-0.3,0-0.6,0-0.9-0.1c0.6,2,2.4,3.4,4.6,3.4 c-1.7,1.3-3.8,2.1-6.1,2.1c-0.4,0-0.8,0-1.2-0.1c2.2,1.4,4.8,2.2,7.5,2.2c9.1,0,14-7.5,14-14c0-0.2,0-0.4,0-0.6 C22.5,6.4,23.3,5.5,24,4.6z' />
                  </svg>
                </a>
              </div>
              <div className='flex items-center'>
                <a
                  href='/'
                  className='text-gray-600 transition-colors duration-300 hover:text-deep-purple-accent-400'
                >
                  <svg viewBox='0 0 30 30' fill='currentColor' className='h-6'>
                    <circle cx='15' cy='15' r='4' />
                    <path d='M19.999,3h-10C6.14,3,3,6.141,3,10.001v10C3,23.86,6.141,27,10.001,27h10C23.86,27,27,23.859,27,19.999v-10   C27,6.14,23.859,3,19.999,3z M15,21c-3.309,0-6-2.691-6-6s2.691-6,6-6s6,2.691,6,6S18.309,21,15,21z M22,9c-0.552,0-1-0.448-1-1   c0-0.552,0.448-1,1-1s1,0.448,1,1C23,8.552,22.552,9,22,9z' />
                  </svg>
                </a>
              </div>
              <div className='flex items-center'>
                <a
                  href='/'
                  className='text-gray-600 transition-colors duration-300 hover:text-deep-purple-accent-400'
                >
                  <svg viewBox='0 0 24 24' fill='currentColor' className='h-5'>
                    <path d='M22,0H2C0.895,0,0,0.895,0,2v20c0,1.105,0.895,2,2,2h11v-9h-3v-4h3V8.413c0-3.1,1.893-4.788,4.659-4.788 c1.325,0,2.463,0.099,2.795,0.143v3.24l-1.918,0.001c-1.504,0-1.795,0.715-1.795,1.763V11h4.44l-1,4h-3.44v9H22c1.105,0,2-0.895,2-2 V2C24,0.895,23.105,0,22,0z' />
                  </svg>
                </a>
              </div>
              <div className='flex items-center'>
                <a
                  href='/'
                  className='text-gray-600 transition-colors duration-300 hover:text-deep-purple-accent-400'
                >
                  <svg viewBox='0 0 24 24' fill='currentColor' className='h-6'>
                    <path d='M23.8,7.2c0,0-0.2-1.7-1-2.4c-0.9-1-1.9-1-2.4-1C17,3.6,12,3.6,12,3.6h0c0,0-5,0-8.4,0.2 c-0.5,0.1-1.5,0.1-2.4,1c-0.7,0.7-1,2.4-1,2.4S0,9.1,0,11.1v1.8c0,1.9,0.2,3.9,0.2,3.9s0.2,1.7,1,2.4c0.9,1,2.1,0.9,2.6,1 c1.9,0.2,8.2,0.2,8.2,0.2s5,0,8.4-0.3c0.5-0.1,1.5-0.1,2.4-1c0.7-0.7,1-2.4,1-2.4s0.2-1.9,0.2-3.9v-1.8C24,9.1,23.8,7.2,23.8,7.2z M9.5,15.1l0-6.7l6.5,3.4L9.5,15.1z' />
                  </svg>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div className='inset-y-0 top-0 right-0 w-full max-w-xl px-4 mx-auto mb-6 md:px-0 lg:pl-8 lg:pr-0 lg:mb-0 lg:mx-0 lg:w-1/2 lg:max-w-full lg:absolute xl:px-0'>
        <img
          className='object-cover w-full h-56 rounded shadow-lg lg:rounded-none lg:shadow-none md:h-96 lg:h-full'
          src='https://images.pexels.com/photos/3184360/pexels-photo-3184360.jpeg?auto=compress&amp;cs=tinysrgb&amp;dpr=2&amp;h=750&amp;w=1260'
          alt=''
        />
      </div>
    </div>
    // //////////////////////////////////////////////
  );
}
