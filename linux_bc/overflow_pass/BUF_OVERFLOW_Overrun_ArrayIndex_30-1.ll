; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.testStruct = type { i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [6 x i32], align 16
  %i = alloca %struct.testStruct*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [6 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct.testStruct** %i, metadata !19, metadata !DIExpression()), !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 16) #4, !dbg !25
  %0 = bitcast i8* %call to %struct.testStruct*, !dbg !25
  store %struct.testStruct* %0, %struct.testStruct** %i, align 8, !dbg !24
  %call1 = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !26
  call void @srand(i32 %call1) #4, !dbg !27
  %call2 = call i32 @rand() #4, !dbg !28
  %rem = srem i32 %call2, 10, !dbg !29
  %1 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !30
  %arrayidx = getelementptr inbounds %struct.testStruct, %struct.testStruct* %1, i64 3, !dbg !30
  %a = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx, i32 0, i32 0, !dbg !31
  store i32 %rem, i32* %a, align 4, !dbg !32
  %2 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !33
  %arrayidx3 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %2, i64 3, !dbg !33
  %a4 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx3, i32 0, i32 0, !dbg !35
  %3 = load i32, i32* %a4, align 4, !dbg !35
  %cmp = icmp sgt i32 %3, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %4 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !38
  %arrayidx5 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %4, i64 3, !dbg !38
  %a6 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx5, i32 0, i32 0, !dbg !40
  %5 = load i32, i32* %a6, align 4, !dbg !40
  %idxprom = sext i32 %5 to i64, !dbg !41
  %arrayidx7 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  store i32 1, i32* %arrayidx7, align 4, !dbg !42
  br label %if.end16, !dbg !43

if.else:                                          ; preds = %entry
  %6 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !44
  %arrayidx8 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %6, i64 3, !dbg !44
  %a9 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx8, i32 0, i32 0, !dbg !46
  %7 = load i32, i32* %a9, align 4, !dbg !46
  %cmp10 = icmp sge i32 %7, 0, !dbg !47
  br i1 %cmp10, label %if.then11, label %if.end, !dbg !48

if.then11:                                        ; preds = %if.else
  %8 = load %struct.testStruct*, %struct.testStruct** %i, align 8, !dbg !49
  %arrayidx12 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %8, i64 3, !dbg !49
  %a13 = getelementptr inbounds %struct.testStruct, %struct.testStruct* %arrayidx12, i32 0, i32 0, !dbg !51
  %9 = load i32, i32* %a13, align 4, !dbg !51
  %idxprom14 = sext i32 %9 to i64, !dbg !52
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* %buffer, i64 0, i64 %idxprom14, !dbg !52
  store i32 1, i32* %arrayidx15, align 4, !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then11, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !55
  ret i32 %10, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_30-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 12, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 6)
!18 = !DILocation(line: 12, column: 6, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 13, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "testStruct", file: !10, line: 7, size: 32, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !21, file: !10, line: 8, baseType: !13, size: 32)
!24 = !DILocation(line: 13, column: 21, scope: !9)
!25 = !DILocation(line: 13, column: 25, scope: !9)
!26 = !DILocation(line: 14, column: 8, scope: !9)
!27 = !DILocation(line: 14, column: 2, scope: !9)
!28 = !DILocation(line: 15, column: 11, scope: !9)
!29 = !DILocation(line: 15, column: 18, scope: !9)
!30 = !DILocation(line: 15, column: 2, scope: !9)
!31 = !DILocation(line: 15, column: 7, scope: !9)
!32 = !DILocation(line: 15, column: 9, scope: !9)
!33 = !DILocation(line: 17, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !9, file: !10, line: 17, column: 9)
!35 = !DILocation(line: 17, column: 14, scope: !34)
!36 = !DILocation(line: 17, column: 16, scope: !34)
!37 = !DILocation(line: 17, column: 9, scope: !9)
!38 = !DILocation(line: 18, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !10, line: 17, column: 21)
!40 = !DILocation(line: 18, column: 21, scope: !39)
!41 = !DILocation(line: 18, column: 9, scope: !39)
!42 = !DILocation(line: 18, column: 24, scope: !39)
!43 = !DILocation(line: 19, column: 5, scope: !39)
!44 = !DILocation(line: 20, column: 13, scope: !45)
!45 = distinct !DILexicalBlock(scope: !34, file: !10, line: 20, column: 13)
!46 = !DILocation(line: 20, column: 18, scope: !45)
!47 = !DILocation(line: 20, column: 20, scope: !45)
!48 = !DILocation(line: 20, column: 13, scope: !34)
!49 = !DILocation(line: 21, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !10, line: 20, column: 26)
!51 = !DILocation(line: 21, column: 21, scope: !50)
!52 = !DILocation(line: 21, column: 9, scope: !50)
!53 = !DILocation(line: 21, column: 24, scope: !50)
!54 = !DILocation(line: 22, column: 5, scope: !50)
!55 = !DILocation(line: 23, column: 1, scope: !9)
