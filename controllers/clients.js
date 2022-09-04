const express = require("express");
const router = express.Router();
router.get("/", function (request, response) {
    response.render("clients", { errors: [] });
});
module.exports = router;