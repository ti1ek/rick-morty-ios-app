const express = require("express");
const router = express.Router();
const apiController = require("../controllers/apiController");

router.get("/characters", apiController.getCharacters);
router.get("/characters/:id", apiController.getCharacterById);
router.get("/episodes", apiController.getEpisodes);
router.get("/locations", apiController.getLocations);

module.exports = router;
