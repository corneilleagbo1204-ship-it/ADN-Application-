CREATE TABLE IF NOT EXISTS countries (
  id BIGSERIAL PRIMARY KEY,
  code CHAR(2) UNIQUE NOT NULL,
  name VARCHAR(120) NOT NULL,
  currency CHAR(3) NOT NULL,
  enabled BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE IF NOT EXISTS account_types (
  id BIGSERIAL PRIMARY KEY,
  code VARCHAR(60) UNIQUE NOT NULL,
  label VARCHAR(160) NOT NULL,
  enabled BOOLEAN NOT NULL DEFAULT TRUE
);
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY,
  phone_number VARCHAR(32) UNIQUE NOT NULL,
  email VARCHAR(255),
  display_name VARCHAR(180),
  country_code CHAR(2) NOT NULL REFERENCES countries(code),
  account_type_code VARCHAR(60) REFERENCES account_types(code),
  status VARCHAR(32) NOT NULL DEFAULT 'pending',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS roles (
  id BIGSERIAL PRIMARY KEY,
  code VARCHAR(60) UNIQUE NOT NULL,
  label VARCHAR(160) NOT NULL
);
CREATE TABLE IF NOT EXISTS user_roles (
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  role_id BIGINT NOT NULL REFERENCES roles(id),
  PRIMARY KEY (user_id, role_id)
);
CREATE TABLE IF NOT EXISTS audit_events (
  id BIGSERIAL PRIMARY KEY,
  actor_user_id UUID REFERENCES users(id),
  action VARCHAR(120) NOT NULL,
  target_type VARCHAR(80),
  target_id VARCHAR(120),
  metadata JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
INSERT INTO countries (code, name, currency, enabled)
VALUES ('BJ', 'Bénin', 'XOF', TRUE)
ON CONFLICT (code) DO NOTHING;
INSERT INTO account_types (code, label) VALUES
('individual', 'Particulier'),
('professional', 'Professionnel et indépendant'),
('company', 'Entreprise'),
('artisan_service', 'Artisan et prestataire de services'),
('merchant', 'Commerçant et vendeur'),
('buyer', 'Acheteur'),
('association', 'Association et organisation'),
('institution', 'Administration et institution')
ON CONFLICT (code) DO NOTHING;
INSERT INTO roles (code, label) VALUES
('super_admin', 'Super administrateur'),
('finance_admin', 'Administrateur financier'),
('verification_manager', 'Responsable vérification'),
('moderator', 'Modérateur'),
('support', 'Service client')
ON CONFLICT (code) DO NOTHING;
