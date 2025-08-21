const rickMortyService = require("../services/rickMortyService");

exports.getCharacters = async (req, res) => {
  try {
    const { page = 1, name = "" } = req.query;
    const data = await rickMortyService.getCharacters(page, name);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getCharacterById = async (req, res) => {
  try {
    const { id } = req.params;
    const data = await rickMortyService.getCharacterById(id);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getEpisodes = async (req, res) => {
  try {
    const { page = 1 } = req.query;
    const data = await rickMortyService.getEpisodes(page);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getLocations = async (req, res) => {
  try {
    const { page = 1 } = req.query;
    const data = await rickMortyService.getLocations(page);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
