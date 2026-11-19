const test = require('node:test');
const assert = require('node:assert/strict');
const { createServer } = require('./index');

test('GET /health responde 200 con status ok', async () => {
  const server = createServer();
  await new Promise((resolve) => server.listen(0, resolve));
  const { port } = server.address();

  const res = await fetch(`http://localhost:${port}/health`);
  const body = await res.json();

  assert.equal(res.status, 200);
  assert.equal(body.status, 'ok');
  server.close();
});
