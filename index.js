const express = require("express");
const path = require("path");
const app = express();
const fs = require("fs");

// Body parser limit
app.use(express.json({ limit: "100mb" }));

let _path = "build";
if (!fs.existsSync(_path)) {
  _path = "dist";
}
if (!fs.existsSync(_path)) {
  _path = "webapp";
}

app.use(express.static(path.join(__dirname, _path)));

app.get("/*", function (req, res) {
  res.sendFile(path.join(__dirname, _path, "index.html"));
});
app.listen(3000);
