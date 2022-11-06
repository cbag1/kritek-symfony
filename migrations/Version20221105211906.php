<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20221105211906 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE invoice (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, date DATE DEFAULT NULL, number INTEGER DEFAULT NULL, customer_id INTEGER NOT NULL)');
        $this->addSql('CREATE TABLE invoice_lines (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, invoice_id INTEGER DEFAULT NULL, description CLOB NOT NULL, quantity INTEGER NOT NULL, amount NUMERIC(10, 1) NOT NULL, vat NUMERIC(10, 1) NOT NULL, total_vat NUMERIC(10, 1) NOT NULL, CONSTRAINT FK_72DBDC232989F1FD FOREIGN KEY (invoice_id) REFERENCES invoice (id) NOT DEFERRABLE INITIALLY IMMEDIATE)');
        $this->addSql('CREATE INDEX IDX_72DBDC232989F1FD ON invoice_lines (invoice_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE invoice');
        $this->addSql('DROP TABLE invoice_lines');
    }
}
