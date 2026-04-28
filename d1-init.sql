-- Tabel untuk menyimpan daftar email (mailbox) yang dibuat
CREATE TABLE IF NOT EXISTS mailboxes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    address TEXT UNIQUE NOT NULL,
    user_id TEXT, -- Null untuk Guest
    type TEXT DEFAULT 'guest', -- guest, registered, premium
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    expires_at DATETIME
);

-- Tabel untuk menyimpan isi email masuk
CREATE TABLE IF NOT EXISTS messages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mailbox_id INTEGER,
    sender TEXT,
    subject TEXT,
    body_html TEXT,
    body_text TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(mailbox_id) REFERENCES mailboxes(id)
);
