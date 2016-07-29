#!/bin/bash

echo "Initializing shard0"
mongo --port 27101 << 'EOF'
config = { _id: "shard0", members:[
          { _id : 0, host : "mongo1:27018" },
          { _id : 1, host : "mongo2:27018" },
          { _id : 2, host : "mongo3:27018" }]};
rs.initiate(config);
EOF

echo "Initializing shard1"
mongo --port 27104 << 'EOF'
config = { _id: "shard1", members:[
          { _id : 0, host : "mongo4:27018" },
          { _id : 1, host : "mongo5:27018" },
          { _id : 2, host : "mongo6:27018" }]};
rs.initiate(config);
EOF

echo "Initializing shard2"
mongo --port 27107 << 'EOF'
config = { _id: "shard2", members:[
          { _id : 0, host : "mongo7:27018" },
          { _id : 1, host : "mongo8:27018" },
          { _id : 2, host : "mongo9:27018" }]};
rs.initiate(config);
EOF
