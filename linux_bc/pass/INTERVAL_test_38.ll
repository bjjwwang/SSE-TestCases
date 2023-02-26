; ModuleID = 'linux_bc/pass/INTERVAL_test_38.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_38.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.testStruct = type { i32* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %s1 = alloca %struct.testStruct, align 8
  %s2 = alloca %struct.testStruct, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 -1, i32* %x, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s1, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s2, metadata !22, metadata !DIExpression()), !dbg !23
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !24
  store i32* %x, i32** %a, align 8, !dbg !25
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !26
  call void @srand(i32 %call) #5, !dbg !27
  %0 = bitcast %struct.testStruct* %s2 to i8*, !dbg !28
  %1 = bitcast %struct.testStruct* %s1 to i8*, !dbg !28
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 8, i1 false), !dbg !28
  %call1 = call i32 @rand() #5, !dbg !29
  %rem = srem i32 %call1, 10, !dbg !30
  %a2 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !31
  %2 = load i32*, i32** %a2, align 8, !dbg !31
  store i32 %rem, i32* %2, align 4, !dbg !32
  %a3 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !33
  %3 = load i32*, i32** %a3, align 8, !dbg !33
  %4 = load i32, i32* %3, align 4, !dbg !34
  %a4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !35
  %5 = load i32*, i32** %a4, align 8, !dbg !35
  %6 = load i32, i32* %5, align 4, !dbg !36
  %cmp = icmp eq i32 %4, %6, !dbg !37
  br i1 %cmp, label %land.lhs.true, label %land.end, !dbg !38

land.lhs.true:                                    ; preds = %entry
  %a5 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !39
  %7 = load i32*, i32** %a5, align 8, !dbg !39
  %8 = load i32, i32* %7, align 4, !dbg !40
  %cmp6 = icmp sge i32 %8, 0, !dbg !41
  br i1 %cmp6, label %land.rhs, label %land.end, !dbg !42

land.rhs:                                         ; preds = %land.lhs.true
  %a7 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !43
  %9 = load i32*, i32** %a7, align 8, !dbg !43
  %10 = load i32, i32* %9, align 4, !dbg !44
  %cmp8 = icmp slt i32 %10, 10, !dbg !45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %11 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp8, %land.rhs ], !dbg !46
  call void @svf_assert(i1 zeroext %11), !dbg !47
  %12 = load i32, i32* %retval, align 4, !dbg !48
  ret i32 %12, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_38.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_38.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 14, type: !13)
!15 = !DILocation(line: 14, column: 9, scope: !9)
!16 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 15, type: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 9, size: 64, elements: !18)
!18 = !{!19}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !17, file: !10, line: 10, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!21 = !DILocation(line: 15, column: 23, scope: !9)
!22 = !DILocalVariable(name: "s2", scope: !9, file: !10, line: 16, type: !17)
!23 = !DILocation(line: 16, column: 23, scope: !9)
!24 = !DILocation(line: 17, column: 8, scope: !9)
!25 = !DILocation(line: 17, column: 10, scope: !9)
!26 = !DILocation(line: 18, column: 11, scope: !9)
!27 = !DILocation(line: 18, column: 5, scope: !9)
!28 = !DILocation(line: 19, column: 5, scope: !9)
!29 = !DILocation(line: 20, column: 15, scope: !9)
!30 = !DILocation(line: 20, column: 22, scope: !9)
!31 = !DILocation(line: 20, column: 10, scope: !9)
!32 = !DILocation(line: 20, column: 13, scope: !9)
!33 = !DILocation(line: 21, column: 21, scope: !9)
!34 = !DILocation(line: 21, column: 16, scope: !9)
!35 = !DILocation(line: 21, column: 32, scope: !9)
!36 = !DILocation(line: 21, column: 27, scope: !9)
!37 = !DILocation(line: 21, column: 24, scope: !9)
!38 = !DILocation(line: 21, column: 35, scope: !9)
!39 = !DILocation(line: 21, column: 43, scope: !9)
!40 = !DILocation(line: 21, column: 38, scope: !9)
!41 = !DILocation(line: 21, column: 46, scope: !9)
!42 = !DILocation(line: 21, column: 51, scope: !9)
!43 = !DILocation(line: 21, column: 59, scope: !9)
!44 = !DILocation(line: 21, column: 54, scope: !9)
!45 = !DILocation(line: 21, column: 61, scope: !9)
!46 = !DILocation(line: 0, scope: !9)
!47 = !DILocation(line: 21, column: 5, scope: !9)
!48 = !DILocation(line: 22, column: 1, scope: !9)
