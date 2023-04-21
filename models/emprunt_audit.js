'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class emprunt_audit extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  emprunt_audit.init({
    idEmprunt: DataTypes.INTEGER,
    idExemplaire: DataTypes.INTEGER,
    idEmprunteur: DataTypes.INTEGER,
    nombreEmprunt: DataTypes.INTEGER,
    dateEmprunt: DataTypes.DATE,
    AncienDateRetour: DataTypes.DATE,
    NouvelDateRetour: DataTypes.DATE,
    action: DataTypes.STRING,
    date: DataTypes.DATE,
    utilisateur: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'emprunt_audit',
  });
  return emprunt_audit;
};