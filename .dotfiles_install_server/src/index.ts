import express from "express";
import fs from "fs";

console.log("Getting install scripts...");

const common = fs.readFileSync("./scripts/common.sh").toString();
const insert = "# $$-> insert";

const linuxInstall = common.replace(
    insert,
    fs.readFileSync("./scripts/linux.sh").toString()
);

const wslInstall = common.replace(insert, fs.readFileSync("./scripts/wsl.sh").toString());

console.log("Starting server");

const app = express();
const port = 3000;

app.get("/", (req, res) => {
    res.type("text/plain");
    res.send(linuxInstall);
});

app.get("/wsl", (req, res) => {
    res.type("text/plain");
    res.send(wslInstall);
});

app.listen(port, () => {
    console.log(`Running on ${port}`);
});
