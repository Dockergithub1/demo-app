const http = require("http");
const PORT = 3000;

http.createServer((req, res) => {
  res.end("Hello from Jenkins CI/CD Pipeline!");
}).listen(PORT, () => {
  console.log("Server running on port", PORT);
});
