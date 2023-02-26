; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.myStruct = type { [6 x i32] }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %s1 = alloca %struct.myStruct, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.myStruct* %s1, metadata !14, metadata !DIExpression()), !dbg !21
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !22
  call void @srand(i32 %call) #4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %a, metadata !24, metadata !DIExpression()), !dbg !25
  %call1 = call i32 @rand() #4, !dbg !26
  %rem = srem i32 %call1, 100, !dbg !27
  store i32 %rem, i32* %a, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %b, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 1, i32* %b, align 4, !dbg !29
  %call2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %a), !dbg !30
  %0 = load i32, i32* %a, align 4, !dbg !31
  %1 = load i32, i32* %b, align 4, !dbg !32
  %add = add nsw i32 %0, %1, !dbg !33
  store i32 %add, i32* %b, align 4, !dbg !34
  %2 = load i32, i32* %a, align 4, !dbg !35
  %cmp = icmp sgt i32 %2, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.else, !dbg !38

if.then:                                          ; preds = %entry
  %f1 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s1, i32 0, i32 0, !dbg !39
  %3 = load i32, i32* %b, align 4, !dbg !41
  %idxprom = sext i32 %3 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* %f1, i64 0, i64 %idxprom, !dbg !42
  store i32 1, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.else:                                          ; preds = %entry
  %f13 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %s1, i32 0, i32 0, !dbg !45
  %4 = load i32, i32* %b, align 4, !dbg !47
  %idxprom4 = sext i32 %4 to i64, !dbg !48
  %arrayidx5 = getelementptr inbounds [6 x i32], [6 x i32]* %f13, i64 0, i64 %idxprom4, !dbg !48
  store i32 1, i32* %arrayidx5, align 4, !dbg !49
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %5, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 11, type: !11, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_10-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "s1", scope: !9, file: !10, line: 12, type: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !10, line: 7, size: 192, elements: !16)
!16 = !{!17}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "f1", scope: !15, file: !10, line: 8, baseType: !18, size: 192)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 192, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 6)
!21 = !DILocation(line: 12, column: 21, scope: !9)
!22 = !DILocation(line: 13, column: 8, scope: !9)
!23 = !DILocation(line: 13, column: 2, scope: !9)
!24 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 14, type: !13)
!25 = !DILocation(line: 14, column: 9, scope: !9)
!26 = !DILocation(line: 14, column: 13, scope: !9)
!27 = !DILocation(line: 14, column: 20, scope: !9)
!28 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 15, type: !13)
!29 = !DILocation(line: 15, column: 9, scope: !9)
!30 = !DILocation(line: 16, column: 5, scope: !9)
!31 = !DILocation(line: 17, column: 9, scope: !9)
!32 = !DILocation(line: 17, column: 13, scope: !9)
!33 = !DILocation(line: 17, column: 11, scope: !9)
!34 = !DILocation(line: 17, column: 7, scope: !9)
!35 = !DILocation(line: 18, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !9, file: !10, line: 18, column: 9)
!37 = !DILocation(line: 18, column: 11, scope: !36)
!38 = !DILocation(line: 18, column: 9, scope: !9)
!39 = !DILocation(line: 19, column: 12, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 18, column: 16)
!41 = !DILocation(line: 19, column: 15, scope: !40)
!42 = !DILocation(line: 19, column: 9, scope: !40)
!43 = !DILocation(line: 19, column: 18, scope: !40)
!44 = !DILocation(line: 20, column: 5, scope: !40)
!45 = !DILocation(line: 22, column: 12, scope: !46)
!46 = distinct !DILexicalBlock(scope: !36, file: !10, line: 21, column: 10)
!47 = !DILocation(line: 22, column: 15, scope: !46)
!48 = !DILocation(line: 22, column: 9, scope: !46)
!49 = !DILocation(line: 22, column: 18, scope: !46)
!50 = !DILocation(line: 24, column: 1, scope: !9)
