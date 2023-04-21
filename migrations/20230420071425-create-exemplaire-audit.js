'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('exemplaire_audits', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      idExemplaire: {
        type: Sequelize.INTEGER
      },
      ancienNombre: {
        type: Sequelize.INTEGER
      },
      nouveauNombre: {
        type: Sequelize.INTEGER
      },
      action: {
        type: Sequelize.STRING
      },
      date: {
        type: Sequelize.DATE
      },
      utilisateur: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('exemplaire_audits');
  }
};