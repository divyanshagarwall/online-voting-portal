<?php
if(isset($_GET['delete_id']))
    {
        $d_id = $_GET['delete_id'];
        mysqli_query($db, "DELETE FROM users WHERE id = '". $d_id ."'") OR die(mysqli_error($db));
?>
       <div class="alert alert-danger my-3" role="alert">
            Voter has been removed.
        </div>
<?php

    }
?>


<div class="col-8">
    <h3>Voters List</h3>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">S.No</th>
                <th scope="col">UserName</th>
                <th scope="col">Contact Number</th>
                <!-- <th scope="col">Action</th> -->
            </tr>
        </thead>
        <tbody>
            <?php
            $fetchingData = mysqli_query($db, "SELECT * FROM users") or die(mysqli_error($db));
            $isAnyElectionAdded = mysqli_num_rows($fetchingData);

            if ($isAnyElectionAdded) {
                $sno = 1;
                while ($row = mysqli_fetch_assoc($fetchingData)) {
                    $user_id = $row['id'];
            ?>
                    <?php
                    if($row['user_role']=='Voter'){
                    ?>
                    <tr>
                        <td><?php echo $sno++; ?></td>
                        <td><?php echo $row['username']; ?></td>
                        <td><?php echo $row['contact_no']; ?></td>
                        <!-- <td>
                            <button class="btn btn-sm btn-danger" onclick="DeleteData(<?php echo $user_id; ?>)"> Delete </button>
                        </td> -->
                    </tr>
                    <?php
                    }
                    ?>
                <?php
                }
            }
                ?>
        </tbody>
    </table>
</div>
<script>
    const DeleteData = (e_id) => 
    {
        let c = confirm("Are you really want to delete it?");

        if(c == true)
        {
            location.assign("index.php?manageVotersPage=1&delete_id=" + e_id);
        }
    }
</script>