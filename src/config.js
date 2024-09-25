const BACKEND_HOST = process.env.FEEDBACK_BACKEND_HOST;
const BACKEND_PORT = process.env.FEEDBACK_BACKEND_PORT;

export const BACKEND_URL = `http://${BACKEND_HOST}:${BACKEND_PORT}/feedback`;