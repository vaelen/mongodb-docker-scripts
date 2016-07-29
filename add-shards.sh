#!/bin/bash

echo "configuring sharding"
mongo <<'EOF'
db.adminCommand( { addshard : "shard0/mongo1:27018" } );
db.adminCommand( { addshard : "shard1/mongo2:27018" } );
db.adminCommand( { addshard : "shard2/mongo3:27018" } );

// db.adminCommand({enableSharding: "school"})
// db.adminCommand({shardCollection: "school.students", key: {student_id:1}});
EOF
