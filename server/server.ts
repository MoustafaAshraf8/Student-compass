import express, { Express, Request, Response , Application } from 'express';
import { studentRouter } from './routes/studentRouter';
import dotenv from 'dotenv';
//For env File 
dotenv.config();

const app: Application = express();

app.use('/student', studentRouter);


const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});