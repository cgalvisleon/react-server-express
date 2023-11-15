require("dotenv").config();
const express = require("express");
const path = require("path");
const app = express();
const route = process.env.PATH || "build";

// Body parser limit
app.use(express.json({ limit: "100mb" }));

app.use(express.static(path.join(__dirname, route)));

app.get("/*", function (req, res) {
  res.sendFile(path.join(__dirname, route, "index.html"));
});
app.listen(3000);
