'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class emprunt extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  emprunt.init({
    idExemplaire: DataTypes.INTEGER,
    idEmprunteur: DataTypes.INTEGER,
    nombreEmprunt: DataTypes.INTEGER,
    dateEmprunt: DataTypes.DATE,
    dateRetour: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'emprunt',
  });
  return emprunt;
};