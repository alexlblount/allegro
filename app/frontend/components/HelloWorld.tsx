import React from "react";

interface HelloWorldProps {
  name: string;
}

export function HelloWorld({ name }: HelloWorldProps) {
  return (
    <div className="text-blue-500 text-2xl">
      Hello, {name}! Welcome to TypeScript with React.
    </div>
  );
}
