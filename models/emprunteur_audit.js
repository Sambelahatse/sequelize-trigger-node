'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class emprunteur_audit extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  emprunteur_audit.init({
    idEmprunteur: DataTypes.INTEGER,
    ancienNom: DataTypes.STRING,
    nouveauNom: DataTypes.STRING,
    action: DataTypes.STRING,
    date: DataTypes.DATE,
    utilisateur: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'emprunteur_audit',
  });
  return emprunteur_audit;
};