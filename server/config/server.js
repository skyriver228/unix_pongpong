module.exports = ({ env }) => ({
  host: env('HOST', 'http://10.125.218.14/'),
  port: env.int('PORT', 1337),
  app: {
    keys: env.array('APP_KEYS'),
  },
});
