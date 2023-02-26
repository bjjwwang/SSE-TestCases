; ModuleID = 'linux_bc/pass/BASIC_cstring_cmp_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_cstring_cmp_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.name = private unnamed_addr constant [10 x i8] c"svf\00\00\00\00\00\00\00", align 1
@__const.main.name2 = private unnamed_addr constant [10 x i8] c"sse\00\00\00\00\00\00\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %name = alloca [10 x i8], align 1
  %len = alloca i32, align 4
  %name2 = alloca [10 x i8], align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i8]* %name, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [10 x i8]* %name to i8*, !dbg !19
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.main.name, i32 0, i32 0), i64 10, i1 false), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %len, metadata !20, metadata !DIExpression()), !dbg !21
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %name, i64 0, i64 0, !dbg !22
  %call = call i64 @strlen(i8* %arraydecay) #5, !dbg !23
  %conv = trunc i64 %call to i32, !dbg !23
  store i32 %conv, i32* %len, align 4, !dbg !21
  %1 = load i32, i32* %len, align 4, !dbg !24
  %cmp = icmp eq i32 %1, 3, !dbg !25
  call void @svf_assert(i1 zeroext %cmp), !dbg !26
  call void @llvm.dbg.declare(metadata [10 x i8]* %name2, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = bitcast [10 x i8]* %name2 to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.main.name2, i32 0, i32 0), i64 10, i1 false), !dbg !28
  %arraydecay2 = getelementptr inbounds [10 x i8], [10 x i8]* %name, i64 0, i64 0, !dbg !29
  %arraydecay3 = getelementptr inbounds [10 x i8], [10 x i8]* %name2, i64 0, i64 0, !dbg !30
  %call4 = call i32 @strcmp(i8* %arraydecay2, i8* %arraydecay3) #5, !dbg !31
  %tobool = icmp ne i32 %call4, 0, !dbg !31
  call void @svf_assert(i1 zeroext %tobool), !dbg !32
  ret i32 0, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @svf_assert(i1 zeroext) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @strcmp(i8*, i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_cstring_cmp_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_cstring_cmp_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "name", scope: !9, file: !10, line: 10, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 10, column: 10, scope: !9)
!20 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 11, type: !13)
!21 = !DILocation(line: 11, column: 9, scope: !9)
!22 = !DILocation(line: 11, column: 22, scope: !9)
!23 = !DILocation(line: 11, column: 15, scope: !9)
!24 = !DILocation(line: 12, column: 16, scope: !9)
!25 = !DILocation(line: 12, column: 20, scope: !9)
!26 = !DILocation(line: 12, column: 5, scope: !9)
!27 = !DILocalVariable(name: "name2", scope: !9, file: !10, line: 14, type: !15)
!28 = !DILocation(line: 14, column: 10, scope: !9)
!29 = !DILocation(line: 15, column: 23, scope: !9)
!30 = !DILocation(line: 15, column: 29, scope: !9)
!31 = !DILocation(line: 15, column: 16, scope: !9)
!32 = !DILocation(line: 15, column: 5, scope: !9)
!33 = !DILocation(line: 16, column: 5, scope: !9)
