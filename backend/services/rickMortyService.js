const axios = require("axios");

class RickMortyService {
  constructor() {
    this.baseURL = "https://rickandmortyapi.com/api";
  }

  async getCharacters(page = 1, name = "") {
    try {
      let url = `${this.baseURL}/character?page=${page}`;
      if (name) url += `&name=${name}`;
      
      const response = await axios.get(url);
      return response.data;
    } catch (error) {
      throw error;
    }
  }

  async getCharacterById(id) {
    try {
      const response = await axios.get(`${this.baseURL}/character/${id}`);
      return response.data;
    } catch (error) {
      throw error;
    }
  }

  async getEpisodes(page = 1) {
    try {
      const response = await axios.get(`${this.baseURL}/episode?page=${page}`);
      return response.data;
    } catch (error) {
      throw error;
    }
  }

  async getLocations(page = 1) {
    try {
      const response = await axios.get(`${this.baseURL}/location?page=${page}`);
      return response.data;
    } catch (error) {
      throw error;
    }
  }
}

module.exports = new RickMortyService();
