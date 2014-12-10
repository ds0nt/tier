#!/bin/bash

vagrant ssh -- /bin/bash << EOF

	dockerid=\$(docker run -d -t -p 80:80 -v /home/core:/home metagen/nodejs-dev);

	if [ \$? -eq 1 ]; then
		echo 'Docker Failed to Launch';
		docker rm \$dockerid;
		exit 1;
	fi

	
	echo \$dockerid > /home/core/dockerid;

	echo "Launched" \$dockerid;
EOF