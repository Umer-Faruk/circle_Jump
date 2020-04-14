local bard = {x = 2,y=20,width = 30,height=40,c={.87,.84,.27}}
-- local uwall = {x = 600,y=0,width=60,height=800,c={0,.25,.1}}
local wall = {x=700,y=0,width=50,height=300,c={0,.25,0}}
local wall2 = {x=700,y=0,width=50,height=300,c={0,.25,0}}

local bscr = 0
local gscor =0
myfount1 = love.graphics.newFont(20)
myfount2 = love.graphics.newFont(50)




function love.load()
     yspeed = 0
     emts = 120
     blife = 5
     
     function resetwall()
          
           wall.height = love.math.random(10,400)
          wall.x = 700
          wall2.height = love.math.random(10,400)
          wall2.x = 900


     end
     function rsetb()
          bard.x =20
          bard.y = 20
     end


end

function iscollide(ax,ay,aw,ah,bx,by,bw,bh,b1x,b1y,b1w,b1h)

     return (ax < bx+bw and ay < by+bh and bx < ax+aw and by < ay+ah ) or (ax < b1x+b1w and ay < b1y+b1h and b1x < ax+aw and b1y < ay+ah )

end

function love.update(dt)
     --player 

     yspeed = yspeed + (200 * dt)

     bard.y =  bard.y+(yspeed*dt)
     
     --moving wall

     wall.x = wall.x - 200 * dt

     -- print(wall.x)
     if wall.x < -60 then
          if blife > 0 then 
               gscor = gscor + 1
          end
          
          resetwall()


     end

     if bard.y > 600 then
         
          if blife > 0 then
              
               blife = blife - 1
               rsetb()
          end
          
     end

     if iscollide(bard.x,bard.y,bard.width,bard.height,wall.x,wall.y,wall.width,wall.height,wall.x,wall.height+emts,wall.width,800-wall.height-emts) then
          print("collision")
          -- blife = blife - 1
          -- love.load()
          resetwall()
          bard.x = 0
          if bscr >0 then
          bscr = bscr - 10
          end
          if gscor > 0 then
          gscor = gscor - 1
          end
     end

     if blife > 0 then
          bscr = bscr + 1

     end

     
end

function love.draw()

    

     --background
     love.graphics.setColor(.14,.12,.16)
     love.graphics.rectangle('fill',0,0,700,800)

     --Score menu
     love.graphics.setColor(1,0,0)
     love.graphics.setFont(myfount1)
     love.graphics.print( "life points :"..tostring(blife),650,50)
     love.graphics.print("Score: "..tostring(bscr),650,100)
     love.graphics.print("GScore : "..tostring(gscor),650,150)

     --player
     love.graphics.setColor(bard.c)
     love.graphics.rectangle('fill',bard.x,bard.y,bard.width,bard.height,30)
     -- print(bard.y)


     --wall
     love.graphics.setColor(wall.c)
     love.graphics.rectangle('fill',wall.x,wall.y,wall.width,wall.height,10)

     love.graphics.setColor(1,0,0)
     love.graphics.rectangle('fill',wall.x,wall.height+emts,wall.width,800-wall.height-emts,10)

     --2

     love.graphics.setColor(wall.c)
     love.graphics.rectangle('fill',wall2.x+400,wall2.y,wall.width,wall.height,10)

     love.graphics.setColor(1,0,0)
     love.graphics.rectangle('fill',wall2.x+400,wall2.height+emts,wall.width,800-wall.height-emts,10)

     -- love.graphics.print(blife,700,50)
     -- bscr = bscr + 1
   
     
     if blife == 0 then
          love.graphics.setFont(myfount2)
          love.graphics.print('Game Over',400,400)


     end

    
end

function love.keypressed(key)
     -- print(key)
     if key == 'up' then
          if bard.y >= 2 then
               yspeed = -200
          end

     end
     if key == 'right' then
          
          bard.x = bard.x + 30 

     end

end


