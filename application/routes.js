async function index() {
  return {
    statusCode: 200,
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify("Hello World!"),
  };
}

async function greet(name) {
  return {
    statusCode: 200,
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(`Hello ${name}!`),
  };
}

async function routeHandler(event, context) {
  const { pathRaw, httpMethod } = event;
  const pathPrefix = process.env.PATH_PREFIX || "/hello";
  const path = pathRaw.replace(pathPrefix, "") || "/";
  const routeKey = `${path}_${httpMethod}`;

  switch (routeKey) {
    case "/_GET":
      return await index();
    case "/_POST":
      var body = JSON.parse(event.body);
      return await greet(body.name);
    default:
      return {
        statusCode: 404,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify("Not Found"),
      };
  }
}

export default async function route(event, context) {
  try {
    return await routeHandler(event, context);
  } catch (error) {
    console.log(error);

    return {
      statusCode: 500,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        error: "Internal Server Error.",
        hint: "Check your request or contact the administrator.",
      }),
    };
  }
}
