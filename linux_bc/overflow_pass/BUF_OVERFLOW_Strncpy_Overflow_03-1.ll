; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Strncpy_Overflow_03-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Strncpy_Overflow_03-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %src = alloca [200 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [200 x i8]* %src, metadata !14, metadata !DIExpression()), !dbg !19
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %src, i64 0, i64 0, !dbg !20
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 97, i64 200, i1 false), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %a, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %a), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %b, metadata !29, metadata !DIExpression()), !dbg !30
  store i32 -1, i32* %b, align 4, !dbg !30
  %0 = load i32, i32* %a, align 4, !dbg !31
  %1 = load i32, i32* %b, align 4, !dbg !32
  %mul = mul nsw i32 %0, %1, !dbg !33
  store i32 %mul, i32* %b, align 4, !dbg !34
  %2 = load i32, i32* %a, align 4, !dbg !35
  %cmp = icmp sgt i32 %2, -100, !dbg !37
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !38

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %a, align 4, !dbg !39
  %cmp1 = icmp sle i32 %3, 0, !dbg !40
  br i1 %cmp1, label %if.then, label %if.else, !dbg !41

if.then:                                          ; preds = %land.lhs.true
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !42
  %arraydecay3 = getelementptr inbounds [200 x i8], [200 x i8]* %src, i64 0, i64 0, !dbg !44
  %4 = load i32, i32* %b, align 4, !dbg !45
  %conv = sext i32 %4 to i64, !dbg !45
  %call4 = call i8* @strncpy(i8* %arraydecay2, i8* %arraydecay3, i64 %conv) #5, !dbg !46
  br label %if.end, !dbg !47

if.else:                                          ; preds = %land.lhs.true, %entry
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %arraydecay6 = getelementptr inbounds [200 x i8], [200 x i8]* %src, i64 0, i64 0, !dbg !50
  %5 = load i32, i32* %b, align 4, !dbg !51
  %conv7 = sext i32 %5 to i64, !dbg !51
  %call8 = call i8* @strncpy(i8* %arraydecay5, i8* %arraydecay6, i64 %conv7) #5, !dbg !52
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !53
  ret i32 %6, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Strncpy_Overflow_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Strncpy_Overflow_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "src", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !17)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{!18}
!18 = !DISubrange(count: 200)
!19 = !DILocation(line: 8, column: 7, scope: !9)
!20 = !DILocation(line: 9, column: 2, scope: !9)
!21 = !DILocalVariable(name: "dest", scope: !9, file: !10, line: 10, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 10, column: 7, scope: !9)
!26 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 12, type: !13)
!27 = !DILocation(line: 12, column: 6, scope: !9)
!28 = !DILocation(line: 13, column: 2, scope: !9)
!29 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 14, type: !13)
!30 = !DILocation(line: 14, column: 9, scope: !9)
!31 = !DILocation(line: 15, column: 9, scope: !9)
!32 = !DILocation(line: 15, column: 13, scope: !9)
!33 = !DILocation(line: 15, column: 11, scope: !9)
!34 = !DILocation(line: 15, column: 7, scope: !9)
!35 = !DILocation(line: 16, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !9, file: !10, line: 16, column: 9)
!37 = !DILocation(line: 16, column: 11, scope: !36)
!38 = !DILocation(line: 16, column: 18, scope: !36)
!39 = !DILocation(line: 16, column: 21, scope: !36)
!40 = !DILocation(line: 16, column: 23, scope: !36)
!41 = !DILocation(line: 16, column: 9, scope: !9)
!42 = !DILocation(line: 18, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !36, file: !10, line: 16, column: 29)
!44 = !DILocation(line: 18, column: 23, scope: !43)
!45 = !DILocation(line: 18, column: 28, scope: !43)
!46 = !DILocation(line: 18, column: 9, scope: !43)
!47 = !DILocation(line: 19, column: 5, scope: !43)
!48 = !DILocation(line: 22, column: 17, scope: !49)
!49 = distinct !DILexicalBlock(scope: !36, file: !10, line: 20, column: 10)
!50 = !DILocation(line: 22, column: 23, scope: !49)
!51 = !DILocation(line: 22, column: 28, scope: !49)
!52 = !DILocation(line: 22, column: 9, scope: !49)
!53 = !DILocation(line: 24, column: 1, scope: !9)
