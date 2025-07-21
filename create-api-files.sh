#!/bin/bash

# Create API files for all content types

content_types=("feature-card" "integration" "faq" "pricing-plan" "landing-page")

for ct in "${content_types[@]}"; do
  echo "Creating API files for $ct..."
  
  # Create controller
  cat > "src/api/$ct/controllers/$ct.js" << EOF
'use strict';

/**
 * $ct controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::$ct.$ct');
EOF

  # Create route
  cat > "src/api/$ct/routes/$ct.js" << EOF
'use strict';

/**
 * $ct router
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::$ct.$ct');
EOF

  # Create service
  cat > "src/api/$ct/services/$ct.js" << EOF
'use strict';

/**
 * $ct service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::$ct.$ct');
EOF

done

echo "✅ All API files created!"