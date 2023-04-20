const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('exemplaire', {
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    LivreID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'livre',
        key: 'ID'
      }
    },
    NumeroExemplaire: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    DateAchat: {
      type: DataTypes.DATEONLY,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'exemplaire',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "ID" },
        ]
      },
      {
        name: "FKExemplaire107079",
        using: "BTREE",
        fields: [
          { name: "LivreID" },
        ]
      },
    ]
  });
};
