using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TTA_HighSchools_DataTier
{
    public class TeacherDataTier
    {
        public List<Teacher> GetTeachers()
        {
            using (var dbContext = new TTA_ERDEntities())
            {
                return dbContext.Teachers.ToList();
            }
        }

        public bool AddTeacher(Teacher toAdd)
        {
            using (var dbContext = new TTA_ERDEntities())
            {
                try
                {
                    dbContext.Teachers.Add(toAdd);
                    dbContext.SaveChanges();
                    return true;
                }
                catch (Exception)//replace this with validation in future
                {
                    return false;
                }
            }
        }

        public void UpdateTeacher(Teacher teacher)
        {
            using (var dbContext = new TTA_ERDEntities())
            {
                int ID = teacher.TeacherID;
                Teacher toUpdate = dbContext.Teachers.Where(o => o.TeacherID == ID).FirstOrDefault();
                toUpdate.Name = teacher.Name;//turn this into dynamic loop for all properties in the future
                toUpdate.SchoolID = teacher.SchoolID;
                toUpdate.Surname = teacher.Surname;
                toUpdate.Type = teacher.Type;
            }
        }

        public void DeleteTeacher(Teacher teacher)
        {
            using(var dbContext = new TTA_ERDEntities())
            {
                dbContext.Teachers.Remove(dbContext.Teachers.Where(o => o.TeacherID == teacher.TeacherID).FirstOrDefault());
            }
        }
    }
}
