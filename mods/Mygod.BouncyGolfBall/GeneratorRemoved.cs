// CONGRATULATIONS! You found a bunch of codes to generate golf balls! You can inject them directly into EdgeTool source code and compile to make yours!
// the original one is copied from skybox_1

                    model.Vertices[i] = -model.Vertices[i];
                    
                var triangles = vertices.Length / 3;
                for (var i = 0; i < triangles; i++)
                {
                    var j = i * 3;
                    var p0 = new Point3D(model.Vertices[j].X, model.Vertices[j].Y, model.Vertices[j].Z);
                    j++;
                    var p1 = new Point3D(model.Vertices[j].X, model.Vertices[j].Y, model.Vertices[j].Z);
                    j++;
                    var p2 = new Point3D(model.Vertices[j].X, model.Vertices[j].Y, model.Vertices[j].Z);
                    var normal = Vector3D.CrossProduct(p2 - p0, p1 - p0);
                    model.Normals[j] =
                        model.Normals[j - 1] = model.Normals[j - 2] = new Vec3((float) normal.X, (float) normal.Y, (float) normal.Z);
                }
                
                    model.Vertices[i] = 0.325088F * model.Vertices[i];