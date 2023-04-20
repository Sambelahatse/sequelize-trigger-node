'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Livre extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  Livre.init({
    TitreLivre: DataTypes.TEXT,
    AuteurLivre: DataTypes.TEXT,
    EditeurLivre: DataTypes.TEXT,
    DateParution: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'Livre',
    
  });
  return Livre;
};