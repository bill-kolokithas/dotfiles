#!/usr/bin/env bash

uptime | gawk -F, '{ print $(NF - 3), $(NF - 2), $(NF - 1), $NF }'
