-- 1 

SET ip 1
GET ip 
INCR ip 
GET ip 

-- OR

pfadd USER-LOGIN202101301638 A
pfadd USER-LOGIN202101301638 B
pfadd USER-LOGIN202101301638 C
pfadd USER-LOGIN202101301638 D

pfcount USER-LOGIN202101301638

pfadd USER-LOGINLOGIN202101301639 A
pfadd USER-LOGINLOGIN202101301639 B
pfcount USER-LOGIN202101301638 USER-LOGINLOGIN202101301639

-- 2

hmset name:Adam email adam@adam.com
hmget name:Adam email
hmset email:adam@adam.com name:Adam
hmget email:adam@adam.com name

DESC catalogs;
DESC products;

-- 3

db.catalogs.insert({id: 1, name: 'CPU'})
db.catalogs.insert({id: 2, name: 'GPU'})

db.products.insert({id: 1, name: 'AMD RYZEN 4242', description: 'Test CPU', price: 42500, catalog_id: 1})
db.products.insert({id: 2, name: 'NVIDIA GTX 1050', description: 'Test GPU', price: 25000, catalog_id: 2})