db.adminCommand('listDatabases')
db = db.getSiblingDB('dallas-iozt')
db.createCollection('defaults')