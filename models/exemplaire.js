'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class exemplaire extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  exemplaire.init({
    idLivre: DataTypes.INTEGER,
    nombreExemplaire: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'exemplaire',
  });
  return exemplaire;
};