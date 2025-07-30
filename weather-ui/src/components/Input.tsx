'use client'

type InputProps = {
  name: string;
  value: string;
  onChangeInputHandler: (event: React.ChangeEvent<HTMLInputElement>) => void;
};

const Input = ({ name, value, onChangeInputHandler }: InputProps) => {
  return (
    <>
      <div>
        <label
          className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
          {name}
        </label>
        <input
          type="text"
          id="first_name"
          className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder={name}
          value={value}
          name={name}
          onChange={onChangeInputHandler}
        />
      </div>
    </>
  );
};

export default Input;