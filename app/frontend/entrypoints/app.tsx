import React from "react";
import { createRoot } from "react-dom/client";
import { HelloWorld } from "../components/HelloWorld";

const root = createRoot(document.getElementById("root") as HTMLElement);
root.render(<HelloWorld name="Alex" />);
