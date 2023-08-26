import express, { Express, Request, Response , Application } from 'express';
import { studentRouter } from './routes/studentRouter';
import { universityRouter } from './routes/university.Router';
import dotenv from 'dotenv';
import bodyParser from 'body-parser';
//For env File 
dotenv.config();

const app: Application = express();
app.use(bodyParser.urlencoded());

app.use(bodyParser.json());

app.use('/student', studentRouter);
app.use('/university', universityRouter);


const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});