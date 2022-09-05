const express = require("express");
const router = express.Router();

const controller = require("../controllers/clientController");
router.get("/clients", controller.get);

module.exports = router;