const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('emprunt', {
    IdEmprunt: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    ExemplaireID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'exemplaire',
        key: 'ID'
      }
    },
    EmprunteurID: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'emprunteur',
        key: 'ID'
      }
    },
    DateEmprunt: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    DateRetour: {
      type: DataTypes.DATEONLY,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'emprunt',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "IdEmprunt" },
          { name: "ExemplaireID" },
          { name: "EmprunteurID" },
        ]
      },
      {
        name: "FKEmprunt887790",
        using: "BTREE",
        fields: [
          { name: "ExemplaireID" },
        ]
      },
      {
        name: "FKEmprunt328197",
        using: "BTREE",
        fields: [
          { name: "EmprunteurID" },
        ]
      },
    ]
  });
};
