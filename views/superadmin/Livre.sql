-- Livre
DELIMITER $$
CREATE TRIGGER before_livre_add
AFTER INSERT ON livres for EACH ROW BEGIN INSERT INTO livre_audits (idLvre, ancienTitreLivre, nouvelTitreLivre, actionlivre, date, utilisateur) VALUES(NEW.id,'' ,NEW.TitreLivre, 'Insertion',now(), user());
END $$
