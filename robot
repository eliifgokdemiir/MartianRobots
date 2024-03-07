using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MartianRobots
{
    public class Robots
    {
        private int x;
        private int y;
        private char orientation;

        public Robots(int x, int y, char orientation)
        {

            this.x = x;
            this.y = y;
            this.orientation = orientation;

        }
        public void turnLeft()
        {
            switch (orientation)
            {
                case 'N':
                    orientation = 'W';
                    break;
                case 'W':
                    orientation = 'S';
                    break;
                case 'S':
                    orientation = 'E';
                    break;
                case 'E':
                    orientation = 'N';
                    break;
            }
        }
        public void turnRight()
        {
            switch (orientation)
            {
                case 'N':
                    orientation = 'E';
                    break;
                case 'E':
                    orientation = 'S';
                    break;
                case 'S':
                    orientation = 'W';
                    break;
                case 'W':
                    orientation = 'N';
                    break;

            }
        }
        public void Forward()
        {
            switch (orientation)
            {
                case 'N':
                    y += 1;
                    break;
                case 'E':
                    x += 1;
                    break;
                case 'S':
                    y -= 1;
                    break;
                case 'W':
                    x -= 1;
                    break;
            }
        }
        public void Instruction(char instruction)
        {
            switch (instruction)
            {
                case 'L':
                    turnLeft();
                    break;
                case 'R':
                    turnRight();
                    break;
                case 'F':
                    Forward();
                    break;
            }
        }
        public (int, int, char) GetPosition()
        {
            return (x, y, orientation);
        }
    }
    class Program
    {
        static void main()
        {
            string instructions = "FFRFFLBB";
            Robots robot = new Robots(0, 0, 'N');

            foreach (char instruction in instructions)
            {
                robot.Instruction(instruction);
            }

            var Position = robot.GetPosition();
            Console.WriteLine($"Position: {{Position.Item1}}, {{Position.Item2}}, {{Position.Item3}}\");");
        }
    }
}
