<template>
    <div>
        <div class="content">
			<div class="container-fluid">

				<!--~~~~~~~ TABLE ONE ~~~~~~~~~-->
				<div class="_1adminOverveiw_table_recent _box_shadow _border_radious _mar_b30 _p20">
					<p class="_title0">Tags <Button @click="addModal=true"><Icon type="md-add" /> Add admin</Button></p>

					<div class="_overflow _table_div">
						<table class="_table">
								<!-- TABLE TITLE -->
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Email</th>
								<th>User type</th>
								<th>Created at</th>
								<th>Action</th>
							</tr>
								<!-- TABLE TITLE -->

								<!-- ITEMS -->
							<tr v-for="(user, i) in users" :key="users.id" v-if="users.length">
								<td>{{user.id}}</td>
								<td class="_table_name">{{user.fullName}}</td>
								<td class="">{{user.email}}</td>
								<td class="">{{user.userType}}</td>
								<td>{{user.created_at}}</td>
								<td>
                                    <Button type="info" size="small" @click="showEditModal(user, i)">Edit</Button>
                                    <Button type="error" size="small" @click="showDeletingModal(user, i)" :loading="user.isDeleting">Delete</Button>
								</td>
							</tr>
								<!-- ITEMS -->


						</table>
					</div>
				</div>

                <!-- tag adding modal -->
                <Modal
                    v-model="addModal"
                    title="Add admin"
                    :mask-closable="false"
                    :closable="false"
                    >

                    <div class="space">
                        <Input type="text" v-model="data.fullName" placeholder="Full name" />
                    </div>
                    <div class="space">
                        <Input type="email" v-model="data.email" placeholder="Email" />
                    </div>
                    <div class="space">
                        <Input type="password" v-model="data.password" placeholder="Password" />
                    </div>
                    <div class="space">
                        <Select v-model="data.userType" placeholder="Select admin type">
                            <Option value="Admin">Admin</Option>
                            <Option value="Editor">Editor</Option>
                        </Select>
                    </div>





                    <div slot="footer">
                        <Button type="default" @click="addModal=false">Close</Button>
                        <Button type="primary" @click="addAdmin" :disabled="isAdding" :loading="isAdding">{{isAdding ? 'Adding..' : 'Add admin'}}</Button>
                    </div>
                </Modal>

                <!-- tag editing modal -->
                <Modal
                    v-model="editModal"
                    title="Edit tag"
                    :mask-closable="false"
                    :closable="false"
                    >

                    <Input v-model="editData.tagName" placeholder="Edit tag name" />

                    <div slot="footer">
                        <Button type="default" @click="editModal=false">Close</Button>
                        <Button type="primary" @click="editTag" :disabled="isAdding" :loading="isAdding">{{isAdding ? 'Editing..' : 'Edit tag'}}</Button>
                    </div>
                </Modal>

                <!-- tag deleting modal  -->

                <deleteModal></deleteModal>

			</div>
		</div>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import deleteModal from '../components/deleteModal'
export default {
    data() {
        return {
            data : {
                fullName : '',
                email : '',
                password : '',
                userType : 'Admin',
            },
            addModal : false,
            editModal : false,
            isAdding : false,
            users : [],
            editData : {
                tagName : ''
            },
            index : -1,
            showDeleteModal : false,
            isDeleting : false,
            deleteItem : {},
            deletingIndex : -1
        }
    },

    methods : {
        async addAdmin() {
            if(this.data.fullName.trim()=='') return this.e('Full name is required')
            if(this.data.email.trim()=='') return this.e('Email is required')
            if(this.data.password.trim()=='') return this.e('Psssword is required')
            if(this.data.userType.trim()=='') return this.e('User type is required')

            const res = await this.callApi('post', 'app/create_user', this.data)
            if(res.status===201){
                this.tags.unshift(res.data)
                this.s('Admin user has been added successfully!')
                this.addModal = false
                this.data.tagName = ''
            }else{
                if(res.status==422){
                    // console.log(res.data.errors)
                    for(let i in res.data.errors){
                        this.e(res.data.errors[i][0])
                        // console.log(res.data.errors[i])
                    }

                    // if(res.data.errors.tagName){
                    //     this.e(res.data.errors.tagName[0])
                    // }
                    // console.log(res.data.errors.tagName)
                }else{
                    this.swr()
                }
            }
        },
        async editTag() {
            if(this.editData.tagName.trim()=='') return this.e('Tag name is required')
            const res = await this.callApi('post', 'app/edit_tag', this.editData)
            if(res.status===200){
                this.tags[this.index].tagName = this.editData.tagName
                this.s('Tag has edited successfully!')
                this.editModal = false
            }else{
                if(res.status==422){
                    if(res.data.errors.tagName){
                        this.e(res.data.errors.tagName[0])
                    }
                    console.log(res.data.errors.tagName)
                }else{
                    this.swr()
                }
            }
        },
        showEditModal(tag, index) {
            let obj = {
                id : tag.id,
                tagName : tag.tagName
            }
            this.editData = obj
            this.editModal = true
            this.index = index
        },
        async deleteTag() {
            this.isDeleting = true
            const res = await this.callApi('post', 'app/delete_tag', this.deleteItem)
            if(res.status===200){
                this.tags.splice(this.deletingIndex, 1)
                this.s('Tag has been deleted successfully!')
            }else{
                this.swr()
            }
            this.isDeleting = false
            this.showDeleteModal = false
        },
        showDeletingModal(tag, i) {
            const deleteModalObj = {
                showDeleteModal : true,
                deleteUrl : 'app/delete_tag',
                data : tag,
                deletingIndex : i,
                isDeleted : false,
            }
            this.$store.commit('setDeletingModalObj', deleteModalObj)
            console.log('delete method')
            // this.deleteItem = tag
            // this.deletingIndex = i
            // this.showDeleteModal = true
        }
    },

    async created() {
        const res = await this.callApi('get', 'app/get_users')
        if(res.status==200){
            this.users = res.data
        }else{
            this.swr()
        }
    },
    components : {
        deleteModal
    },
    computed : {
        ...mapGetters(['getDeleteModalObj'])
    },
    watch : {
        getDeleteModalObj(obj){
            if(obj.isDeleted){
                this.tags.splice(obj.deletingIndex,1)
            }
        }
    }
}
</script>
