; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.testStruct = type { i32* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %s1 = alloca %struct.testStruct, align 8
  %s2 = alloca %struct.testStruct, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %x, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 -1, i32* %x, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s1, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct.testStruct* %s2, metadata !27, metadata !DIExpression()), !dbg !28
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !29
  store i32* %x, i32** %a, align 8, !dbg !30
  %0 = bitcast %struct.testStruct* %s2 to i8*, !dbg !31
  %1 = bitcast %struct.testStruct* %s1 to i8*, !dbg !31
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 8, i1 false), !dbg !31
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !32
  call void @srand(i32 %call) #5, !dbg !33
  %call1 = call i32 @rand() #5, !dbg !34
  %rem = srem i32 %call1, 10, !dbg !35
  %a2 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !36
  %2 = load i32*, i32** %a2, align 8, !dbg !36
  store i32 %rem, i32* %2, align 4, !dbg !37
  %a3 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s2, i32 0, i32 0, !dbg !38
  %3 = load i32*, i32** %a3, align 8, !dbg !38
  %4 = load i32, i32* %3, align 4, !dbg !40
  %a4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %s1, i32 0, i32 0, !dbg !41
  %5 = load i32*, i32** %a4, align 8, !dbg !41
  %6 = load i32, i32* %5, align 4, !dbg !42
  %cmp = icmp eq i32 %4, %6, !dbg !43
  br i1 %cmp, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 5, !dbg !45
  store i32 1, i32* %arrayidx, align 4, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %7, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

declare dso_local i32 @time(...) #4

; Function Attrs: nounwind
declare dso_local i32 @rand() #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memcpy_Overrun_ArrayIndex_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 12, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 12, column: 6, scope: !9)
!19 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 13, type: !13)
!20 = !DILocation(line: 13, column: 9, scope: !9)
!21 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 14, type: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 7, size: 64, elements: !23)
!23 = !{!24}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !22, file: !10, line: 8, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!26 = !DILocation(line: 14, column: 23, scope: !9)
!27 = !DILocalVariable(name: "s2", scope: !9, file: !10, line: 15, type: !22)
!28 = !DILocation(line: 15, column: 23, scope: !9)
!29 = !DILocation(line: 16, column: 8, scope: !9)
!30 = !DILocation(line: 16, column: 10, scope: !9)
!31 = !DILocation(line: 17, column: 5, scope: !9)
!32 = !DILocation(line: 18, column: 11, scope: !9)
!33 = !DILocation(line: 18, column: 5, scope: !9)
!34 = !DILocation(line: 19, column: 12, scope: !9)
!35 = !DILocation(line: 19, column: 19, scope: !9)
!36 = !DILocation(line: 19, column: 7, scope: !9)
!37 = !DILocation(line: 19, column: 10, scope: !9)
!38 = !DILocation(line: 20, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !9, file: !10, line: 20, column: 8)
!40 = !DILocation(line: 20, column: 8, scope: !39)
!41 = !DILocation(line: 20, column: 24, scope: !39)
!42 = !DILocation(line: 20, column: 19, scope: !39)
!43 = !DILocation(line: 20, column: 16, scope: !39)
!44 = !DILocation(line: 20, column: 8, scope: !9)
!45 = !DILocation(line: 21, column: 3, scope: !46)
!46 = distinct !DILexicalBlock(scope: !39, file: !10, line: 20, column: 28)
!47 = !DILocation(line: 21, column: 13, scope: !46)
!48 = !DILocation(line: 22, column: 2, scope: !46)
!49 = !DILocation(line: 23, column: 1, scope: !9)
