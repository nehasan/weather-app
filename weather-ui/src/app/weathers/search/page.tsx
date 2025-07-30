'use client'
import Input from "@/components/Input";
import React, { useState } from "react";

export default function Search({ }) {
  interface IAddress {
    line: string;
    city: string;
    state: string;
    zip_code: string;
    country: string;
  }
  const [address, setAddress] = useState<IAddress>({
    line: '',
    city: '',
    state: '',
    zip_code: '',
    country: '',
  });
  const [weatherData, setWeatherData] = useState<undefined>(undefined);

  const handleChangeInput = (event: React.ChangeEvent<HTMLInputElement>) => {
    setAddress({
      ...address,
      [event.target.name]: event.target.value
    })
  }

  const handleSearchWeather = async () => {
    const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/v1/weathers/search`;
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ address: address })
    });
    const data = await response.json();
    setWeatherData(data);
  }

  return (
    <>
      <div className="grid gap-3 mb-6 md:grid-cols-3 p-10">
        <Input
          name={"line"}
          value={address.line}
          onChangeInputHandler={handleChangeInput} />
        <Input
          name={"city"}
          value={address.city}
          onChangeInputHandler={handleChangeInput} />
        <Input
          name={"state"}
          value={address.state}
          onChangeInputHandler={handleChangeInput} />
        <Input
          name={"zip_code"}
          value={address.zip_code}
          onChangeInputHandler={handleChangeInput} />
        <Input
          name={"country"}
          value={address.country}
          onChangeInputHandler={handleChangeInput} />
      </div>
      <div className="pl-10">
        <button
          type="submit"
          className="focus:outline-none text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-5 py-2.5 mb-2 dark:bg-purple-600 dark:hover:bg-purple-700 dark:focus:ring-purple-900"
          onClick={handleSearchWeather}>Search Weather
        </button>
      </div>
      <div className="mt-5 pl-10">
        <h3>Weather Data:</h3>
        <div>
          <span>{JSON.stringify(weatherData)}</span>
        </div>
      </div>
    </>
  );
} 