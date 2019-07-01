conn = new Mongo();

db = conn.getDB("test");

db.usuarios.insert({"nombre_usuario": "juan", "clave": "jdfjsnfjsndklcklwemomdmklfmklfgmdmwef"});

db.createUser({user: "test", pwd: "secreto_213", roles: [{role: "read", db: "test"}]});
